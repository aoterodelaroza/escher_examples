#! /usr/bin/octave -q

mol = mol_readxyz("ch4.xyz");
rep = representation_();
rep = mol_ball(mol,rep,{"C","H"},:,-0.2);
rep = mol_ball(mol,rep,"X.?",1,-0.4);
rep = rep_setdefaultscene_view3dscene(rep,[7.02,8.55,10.0],[0.86,0.49,0.15],[-0.36,0.78,-0.51],:,:,:,0);
rep_write_obj(rep,"ch4.obj");
rep_write_pov(rep,"ch4.pov");
run_povray("ch4");

mol = mol_readxyz("h2o.xyz");
rep = representation_();
rep = mol_ball(mol,rep,{"O","H"},:,-0.2);
rep = mol_ball(mol,rep,"X.?",1,-0.4);
rep = rep_setdefaultscene_view3dscene(rep,[7.70,10.93,10.33],[1.00,-0.07,0.04],[-0.04,0.01,1.00],:,:,:,0);
rep_write_obj(rep,"h2o.obj");
rep_write_pov(rep,"h2o.pov");
run_povray("h2o");

mol = mol_readxyz("ch4_ch4.xyz");
rep = representation_();
rep = mol_ball(mol,rep,{"C","H"},:,-0.2);
rep = mol_ball(mol,rep,"X.?",1,-0.4);
rep = rep_setdefaultscene_view3dscene(rep,[11.03 12.95 23.28],[0 0 -1],[0 1 0],:,:,:,0);
rep_write_obj(rep,"ch4_ch4.obj");
rep_write_pov(rep,"ch4_ch4.pov");
run_povray("ch4_ch4");

mol = mol_readxyz("h2o_h2o.xyz");
rep = representation_();
rep = mol_ball(mol,rep,{"O","H"},:,-0.2);
rep = mol_ball(mol,rep,"X.?",1,-0.4);
rep = rep_setdefaultscene_view3dscene(rep,[10.50 11.97 17.29],[0 0 -1],[0 1 0],:,:,:,0);
rep_write_obj(rep,"h2o_h2o.obj");
rep_write_pov(rep,"h2o_h2o.pov");
run_povray("h2o_h2o");

