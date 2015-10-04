#! /usr/bin/octave -q

cr = cr_read_espresso("black_c.scf.out");
mol = mol_readxyz("black_c.xyz");
mol2 = mol_readxyz("mol2.xyz");
mol4 = mol_readxyz("mol4.xyz");
rep = cr_unitcell(cr);
rep = mol_ball(mol4,rep,:,:,-0.5);
# rep = mol_stick(mol,rep,:,:,:,:,0.02);
rep = mol_stick(mol,rep);
rep = mol_stick(mol,rep,"O","H",[1.6 2.0],:,0.03,[0 128 0]);
rep = mol_stick(mol,rep,"N","H",[1.6 2.0],:,0.03,[0 128 0]);
# r = [op_roty(-90) * eye(3); 0 0 -30];
rep = rep_setdefaultscene_tessel(rep,[90 -180 45],:,:,45);
rep_write_pov(rep,"black_c.pov");
rep_write_obj(rep,"black_c.obj");
run_povray("black_c");

