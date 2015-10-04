#! /usr/bin/octave -q

cr = cr_read_espresso("black_r.scf.out");

# mol = mol_readxyz("black_r.xyz");
mol  = mol_readxyz("mol2.xyz");
mol1 = mol_readxyz("mol1.xyz");

rep = cr_unitcell(cr);
rep = mol_ball(mol1,rep,:,:,-0.5);
rep = mol_stick(mol,rep);
rep = mol_stick(mol,rep,"O","H",[1.6 2.0],:,0.03,[0 128 0]);
rep = mol_stick(mol,rep,"N","H",[1.6 2.0],:,0.03,[0 128 0]);
rep = rep_setdefaultscene_tessel(rep,[180 0 45],:,:,45);
rep_write_pov(rep,"black_r.pov");
rep_write_obj(rep,"black_r.obj");
run_povray("black_r");

