#! /usr/bin/octave -q

mol = mol_readxyz("ortho.xyz",0);
rep = mol_ball(mol);
rep = mol_stick(mol,rep,"P","H",:,0);
rep = mol_stick(mol,rep,"Au","P",:,0);
rep = mol_stick(mol,rep,"Au","Cl",:,0);
rep_write_obj(rep,"ortho.obj");

mol = mol_readxyz("para.xyz",0);
rep = mol_ball(mol);
rep = mol_stick(mol,rep,"P","H",:,0);
rep = mol_stick(mol,rep,"Au","P",:,0);
rep = mol_stick(mol,rep,"Au","Cl",:,0);
rep_write_obj(rep,"para.obj");

mol = mol_readxyz("eta2.xyz",0);
rep = mol_ball(mol);
rep = mol_stick(mol,rep,"P","H",:,0);
rep = mol_stick(mol,rep,"Au","P",:,0);
rep = mol_stick(mol,rep,"Au","Cl",:,0);
rep_write_obj(rep,"eta2.obj");

mol = mol_readxyz("trimer.xyz",0);
rep = mol_ball(mol);
rep = mol_stick(mol,rep,"P","H",:,0);
rep = mol_stick(mol,rep,"Au","P",:,0);
rep = mol_stick(mol,rep,"Au","Cl",:,0);
rep_write_obj(rep,"trimer.obj");

mol = mol_readxyz("cube.xyz",0);
rep = mol_ball(mol);
rep = mol_stick(mol,rep,"P","H",:,0);
rep = mol_stick(mol,rep,"Au","P",:,0);
rep = mol_stick(mol,rep,"Au","Cl",:,0);
rep_write_obj(rep,"cube.obj");

cr = cr_read_espresso("aucl_tet.scf.out",0);
mol = cr_crystalbox(cr);
rep = mol_ball(mol);
rep = cr_unitcell(cr,rep,:,:,:,[0 0 255]);
rep = mol_stick(mol,rep,"Au","Cl",:,0);
rep_write_obj(rep,"crystal.obj");
