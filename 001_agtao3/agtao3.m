#! /usr/bin/octave -q

cr = cr_read_vasp("POSCAR","POTCAR");
cr = cr_newcell(cr,[-1 1 1],[1 -1 1],[1 1 -1]);
mol = cr_crystalbox(cr);
molbig = cr_crystalbox(cr,[-0.5 -0.5 -0.5],[1.5 1.5 1.5]);
rep = representation_();
rep = mol_ball(mol,rep,"Ag",:,0.8);
rep = mol_ball(mol,rep,"Ta",:,0.6);
rep = mol_ball(mol,rep,"O",:,0.25);
rep = mol_stick(mol,rep,"Ta","O");
rep = mol_polyhedron(mol,molbig,rep,"Ta","O",:,[127 255 127 0 153]);
rep = mol_polyhedron(mol,molbig,rep,"Ta","O",:,[],:);
rep = rep_setdefaultscene_view3dscene(rep,[-19.61 -9.91 24.03],[0.70 0.36 -0.62],[0.05 0.84 0.54]);
rep_write_pov(rep,"agtao3.pov");
rep_write_obj(rep,"agtao3.obj");
run_povray("agtao3");
