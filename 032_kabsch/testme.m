#! /usr/bin/octave -q

format long

mol0 = mol_readxyz("a.xyz");
mol1 = mol_readxyz("b.xyz");

[molout U rms] = mol_align_kabsch(mol0,mol1)
