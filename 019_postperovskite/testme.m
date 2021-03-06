#! /usr/bin/octave -q

## read the files generated by critic2
source("pv.m");
cr_pv = cr;
source("ppv.m");
cr_ppv = cr;
clear cr

## perovskite crystal
mol = cr_crystalbox(cr_pv);
mol0 = cr_crystalbox(cr_pv,[-0.5 -0.5 -0.5],[1.5 1.5 1.5]);
rep = representation_();
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep,"Si","O",[-1 1.5]);
[rep molc molv] = mol_polyhedron(mol,mol0,rep,"Si","O",[-1 1.5],[240 200 160 50 50]);
rep = mol_ball(molv,rep);
rep = cr_unitcell(cr_pv,rep);
rep = rep_setdefaultscene_view3dscene(rep,[2.36 22.17 6.54],[0.00 -1.00 -0.15],[0.00 -0.15 0.99]);
rep_write_obj(rep,"pv.obj");
rep_write_pov(rep,"pv.pov");
run_povray("pv");

## post-perovskite crystal
mol = cr_crystalbox(cr_ppv);
mol0 = cr_crystalbox(cr_ppv,[-1.1 -1.1 -1.1],[2.1 2.1 2.1]);
rep = representation_();
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep,"Si","O",[-1 1.5]);
[rep molc molv] = mol_polyhedron(mol,mol0,rep,"Si","O",[-1 1.5],[240 200 160 50 50]);
rep = mol_ball(molv,rep);
rep = cr_unitcell(cr_ppv,rep);
rep = rep_setdefaultscene_view3dscene(rep,[-20.37 5.20 5.10],[1.00 -0.00 -0.00],[0.00 -0.00 1.00]);
rep_write_obj(rep,"ppv.obj");
rep_write_pov(rep,"ppv.pov");
run_povray("ppv");
