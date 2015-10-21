#! /usr/bin/octave -q

cr = cr_read_espresso("BZDMAZ01_withH.scf.out",0);
mol = cr_molmotif(cr);
rep = representation_();
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep);
rep = cr_unitcell(cr,rep,:,:,0.03,[0 0 255]);

rep = rep_setdefaultscene(rep);
rep_write_obj(rep,"BZDMAZ01.obj");
rep_write_pov(rep,"BZDMAZ01.pov");
system("povray -D -UV +IBZDMAZ01.pov +OBZDMAZ01.png +W1000 +H1000 +A");
