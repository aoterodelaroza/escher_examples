#! /usr/bin/octave -q

cr = cr_read_espresso("ih.scf.out",0);
mol = cr_molmotif(cr);
rep = representation_();
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep);
rep = mol_stick(mol,rep,"O","H",[1.5 2.3],:,0.05,[0 128 0]);
rep = cr_unitcell(cr,rep,:,:,0.03,[0 0 255]);

rep = rep_setdefaultscene_view3dscene(rep,[-3.12,-11.84,5.64],[0.29,0.95,-0.14],[0.0,0.0,1.0]);
rep_write_obj(rep,"ih.obj");
rep_write_pov(rep,"ih.pov");
system("povray -D -UV +Iih.pov +Oih.png +W1000 +H1000 +A");

cr = cr_read_espresso("vi.scf.out",0);
mol = cr_molmotif(cr);
rep = representation_();
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep);
rep = mol_stick(mol,rep,"O","H",[1.5 2.3],:,0.05,[0 128 0]);
rep = cr_unitcell(cr,rep,:,:,0.03,[0 0 255]);

rep = rep_setdefaultscene_view3dscene(rep,[2.61,3.05,18.74],[0.0,0.0,-1.0],[0.0,1.0,0.0]);
rep_write_obj(rep,"vi.obj");
rep_write_pov(rep,"vi.pov");
system("povray -D -UV +Ivi.pov +Ovi.png +W1000 +H1000 +A");
