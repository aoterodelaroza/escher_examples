#! /usr/bin/octave -q

mol = mol_readxyz("co2h.120_120.xyz");
rep = mol_ball(mol);
rep = mol_stick(mol,rep);
rep = mol_stick(mol,rep,"O","H",[1.5 2.3],:,0.03,[0 0 255]);
rep = mol_polyhedron(mol,mol,rep,"C","O",[2 6],[0 0 128 0 225],"","opaque_triangle_default");
rep = rep_setdefaultscene_view3dscene(rep,[-0.91 -18.45 5.94],[0.04 0.95 -0.30],[0.03 0.30 0.95]);
rep_write_obj(rep,"co2h.obj");
rep_write_pov(rep,"co2h.pov");
run_povray("co2h");

mol = mol_readxyz("co2p.120_30.xyz");
rep = mol_ball(mol);
rep = mol_stick(mol,rep);
rep = mol_stick(mol,rep,"O","H",[1.5 2.3],:,0.03,[0 0 255]);
rep = mol_polyhedron(mol,mol,rep,"C","O",[2 6],[0 0 128 0 225],"","opaque_triangle_default");
rep = rep_setdefaultscene_view3dscene(rep,[6.72 -5.05 16.96],[-0.35 0.27 -0.90],[-0.04 0.95 0.30]);
rep_write_obj(rep,"co2p.obj");
rep_write_pov(rep,"co2p.pov");
run_povray("co2p");

mol = mol_readxyz("co2_17_small.xyz");
mol0 = mol_readxyz("co2_17.xyz");
rep = mol_ball(mol);
rep = mol_stick(mol,rep);
rep = mol_stick(mol0,rep);
rep = mol_stick(mol,rep,"O","H",[1.5 2.3],:,0.03,[0 0 255]);
rep = mol_polyhedron(mol,mol,rep,"C","O",[2 6],[0 0 128 0 225],"","opaque_triangle_default");
rep = rep_setdefaultscene_view3dscene(rep,[-2.09 16.00 -22.23],[0.07 -0.58 0.81],[0.01 -0.81 -0.58]);
rep_write_obj(rep,"co2ph.obj");
rep_write_pov(rep,"co2ph.pov");
run_povray("co2ph");
