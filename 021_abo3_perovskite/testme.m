#! /usr/bin/octave -q

## plot for agtao3
cr = cr_read_vasp("agtao3.POSCAR","agtao3.POTCAR");
cr = cr_newcell(cr,[2 0 0],[0 2 0],[0 0 2]);
mol = cr_crystalbox(cr);
molbig = cr_crystalbox(cr,[-1.0 -1.0 -1.0],[2.0 2.0 2.0]);
rep = representation_();
rep = mol_ball(mol,rep,"Ag",:,0.8);
rep = mol_ball(mol,rep,"Ta",:,0.6);
rep = mol_ball(mol,rep,"O",:,0.25);
rep = mol_stick(mol,rep,"Ta","O");
rep = mol_polyhedron(mol,molbig,rep,"Ta_pv","O",:,[127 255 127 0 153]);
rep = mol_polyhedron(mol,molbig,rep,"Ta_pv","O",:,[],:);
rep = rep_setdefaultscene_view3dscene(rep,[-3.19 10.48 32.48],[0.24 -0.22 -0.95],[0.05 0.98 -0.21]);
rep_write_pov(rep,"agtao3.pov");
rep_write_obj(rep,"agtao3.obj");
run_povray("agtao3");

## plot for cutao3
for i = 1:mol.nat
  if (mol.atnumber(i) == 47)
    mol.atnumber(i) = 29;
    mol.atname{i} = "Cu";
  endif
endfor
for i = 1:molbig.nat
  if (molbig.atnumber(i) == 47)
    molbig.atnumber(i) = 29;
    molbig.atname{i} = "Cu";
  endif
endfor
rep = representation_();
#rep = mol_ball(mol,rep,"Cu",:,0.8,[255 255 0]);
rep = mol_ball(mol,rep,"Cu",:,0.8);
rep = mol_ball(mol,rep,"Ta",:,0.6);
rep = mol_ball(mol,rep,"O",:,0.25);
rep = mol_stick(mol,rep,"Ta","O");
rep = mol_polyhedron(mol,molbig,rep,"Ta_pv","O",:,[127 255 127 0 153]);
rep = mol_polyhedron(mol,molbig,rep,"Ta_pv","O",:,[],:);
rep = rep_setdefaultscene_view3dscene(rep,[-3.19 10.48 32.48],[0.24 -0.22 -0.95],[0.05 0.98 -0.21]);
rep_write_pov(rep,"cutao3.pov");
rep_write_obj(rep,"cutao3.obj");
run_povray("cutao3");

## plot for cuta2o6
mol = mol_rmatom(mol,[1 56 35 27]);
rep = representation_();
#rep = mol_ball(mol,rep,"Cu",:,0.8,[255 255 0]);
rep = mol_ball(mol,rep,"Cu",:,0.8);
rep = mol_ball(mol,rep,"Ta",:,0.6);
rep = mol_ball(mol,rep,"O",:,0.25);
rep = mol_stick(mol,rep,"Ta","O");
rep = mol_polyhedron(mol,molbig,rep,"Ta_pv","O",:,[127 255 127 0 153]);
rep = mol_polyhedron(mol,molbig,rep,"Ta_pv","O",:,[],:);
rep = rep_setdefaultscene_view3dscene(rep,[-3.19 10.48 32.48],[0.24 -0.22 -0.95],[0.05 0.98 -0.21]);
rep_write_pov(rep,"cuta2o6.pov");
rep_write_obj(rep,"cuta2o6.obj");
run_povray("cuta2o6");

