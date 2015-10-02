#! /usr/bin/octave -q

# cr = cr_read_espresso("10_bulk_bi2se3h.scf.out");
# mol1 = cr_crystalbox(cr,[-0.3 -0.3 -0.15],[1.7 1.7 0.16]);
# mol2 = cr_crystalbox(cr,[-0.5 -0.5 0.16],[1.5 1.5 0.52]);
# mol3 = cr_crystalbox(cr,[-0.5 -0.5 0.52],[1.5 1.5 0.85]);
# mol = mol_merge(mol1,mol2,mol3);
# 
# mol0 = cr_crystalbox(cr,[-1.5 -1.5 -0.50],[3.0 3.0 1.0]);
# rep = representation_();
# [rep molc molv] = mol_polyhedron(mol,mol0,rep,"BI","SE",[2.5 3.3],[255 215 0 0 220],[0 0 0]);
# mol = mol_merge(molc,molv);
# rep = mol_ball(mol,rep);
# rep = mol_stick(mol,rep);
# # rep = rep_setdefaultscene_tessel(rep,[90 0 45]);
# rep = rep_setdefaultscene_view3dscene(rep,[37.30 37.77 20.08],[-0.70 -0.68 -0.20],[-0.16 -0.13 0.98]);
# 
# rep_write_obj(rep,"bi2se3.obj");
# rep_write_pov(rep,"bi2se3.pov");
# run_povray("bi2se3");

cr = cr_read_espresso("10_bulk_bi4se3h.scf.out");
## all
mol1 = cr_crystalbox(cr,[-0.5 -0.5 -0.12],[1.5 1.5 0.21]);
mol2 = cr_crystalbox(cr,[-0.5 -0.5 0.21],[1.5 1.5 0.55]);
mol3 = cr_crystalbox(cr,[-0.5 -0.5 0.55],[1.5 1.5 0.87]);
mol = mol_merge(mol1,mol2,mol3);
## only Bi
mol1 = cr_crystalbox(cr,[-0.7 -0.7 0.13],[1.5 1.5 0.19]);
mol2 = cr_crystalbox(cr,[-0.7 -0.7 0.46],[1.5 1.5 0.53]);
# mol3 = cr_crystalbox(cr,[-0.5 -0.5 0.80],[1.5 1.5 0.87]);
molbi = mol_merge(mol1,mol2);

mol0 = cr_crystalbox(cr,[-1.5 -1.5 -0.50],[3.0 3.0 1.0]);
rep = representation_();
[rep molc molv] = mol_polyhedron(mol,mol0,rep,"BI","SE",[2.5 3.3],[255 215 0 0 220],[0 0 0]);
mol = mol_merge(molc,molv);
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep);
rep = mol_ball(molbi,rep);
rep = mol_stick(molbi,rep);
# rep = rep_setdefaultscene_tessel(rep,[90 0 45]);
rep = rep_setdefaultscene_view3dscene(rep,[31.45 53.40 16.65],[-0.51 -0.86 -0.06],[-0.01 -0.06 1.00]);

rep_write_obj(rep,"bi4se3.obj");
rep_write_pov(rep,"bi4se3.pov");
run_povray("bi4se3");
