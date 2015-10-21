#! /usr/bin/octave -q

cr = cr_read_vasp("POSCAR","POTCAR");
mol = cr_crystalbox(cr);
rep = cr_unitcell(cr);
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep);
rep = rep_setdefaultscene(rep);
rep_write_pov(rep,"simple.pov");
rep_write_obj(rep,"simple.obj");
run_povray("simple");
