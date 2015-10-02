#! /usr/bin/octave -q

mol = mol_readxyz("adenine_thymine_wcc1.xyz");
rep = mol_ball(mol);
rep = mol_stick(mol,rep);
rep = rep_setdefaultscene_tessel(rep,[90 90 45]);
rep_write_pov(rep,"atwcc.pov");
run_povray("atwcc");

