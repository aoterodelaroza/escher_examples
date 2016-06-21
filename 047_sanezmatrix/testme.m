#! /usr/bin/octave-cli -q

## read the molecule
mol = mol_readxyz("complex.xyz");

## calculate the connectivity with openbabel
mol = mol_connectivity(mol);

## add the hydrogen bond by hand
mol.adjl(end+1,:) = [13 14 1];

## list of dihedrals to rotate
dihlist = [
           14 15 16 19
           15 14 13 12
           13 12 4 5
           13 14 15 16
];

## calculate a sane z-matrix
[izmat izvar mol] = mol_sanezmatrix(mol,dihlist);

## write the z-matrix to a zmat file
mol_writezmat(mol,"complex.gjf",1,izmat,izvar);

