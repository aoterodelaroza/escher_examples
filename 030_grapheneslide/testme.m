#! /usr/bin/octave -q

mol = mol_readxyz("large_00_00.xyz",0);
rep = mol_ball(mol,:,"H",:,:,[200 200 200]);
rep = mol_ball(mol,rep,"C",:,:,[10 10 10]);
rep = mol_stick(mol,rep,"C","H");
rep = mol_stick(mol,rep,"C","C");
rep_write_obj(rep,"large.obj");
rep = rep_setdefaultscene(rep,0);
