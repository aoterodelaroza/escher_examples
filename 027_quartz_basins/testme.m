#! /usr/bin/octave -q

## read from the basin file. Also in critic2 output
x2c = [
       0.92861142170000E+01  -0.46430571085000E+01   0.62554098029316E-15   
       0.00000000000000E+00   0.80420108143658E+01   0.10834687600842E-14
       0.00000000000000E+00   0.00000000000000E+00   0.10215859474400E+02
       ] * .52917720859;
c2x = [
       0.10768766963574E+00   0.62173505052595E-01  -0.13187935992704E-16   
       0.00000000000000E+00   0.12434701010519E+00  -0.13187935992704E-16   
       0.00000000000000E+00   0.00000000000000E+00   0.97887016017194E-01   
       ] / .52917720859;
## from the critic2 output: crystal symmetry operations
op2 = [
       0.000000   -1.000000    0.000000   -0.000000
       1.000000   -1.000000    0.000000    0.000000
       0.000000    0.000000    1.000000    0.333333
       ];
op3 = [
       -1.000000    1.000000    0.000000    0.000000
       -1.000000    0.000000    0.000000    0.000000
       0.000000    0.000000    1.000000   -0.333333
       ];       

## build the underlying crystal structure
cr = cr_read_vasp("POSCAR","POTCAR");
mol = cr_crystalbox(cr,[0.10 0.10 0.0],[1.90 1.90 1.90],2);
rep = representation_();
rep = cr_unitcell(cr,rep,[0 0 0],[0 0 1],:,[128 128 128]);
rep = mol_ball(mol,rep,"Si",:,0.4,[100 100 100]);
rep = mol_ball(mol,rep,"O",:,0.25,[255 13 13]);
rep = mol_polyhedron(mol,mol,rep,"Si",{"O"},:,[0 0 128 0 225],[0 0 128],:,:,0.01);

"bleh1"
## read and transform the basins.
## the transformations read from critic2's complete list
rep1 = rep_read_basin("quartz-1.basin",:,frgb="",ergb=[255 13 13],:,:,0.0025);
"bleh1a"
rot = c2x' * op3(:,1:3)' * x2c';
"bleh1b"
tr = (op3(:,4)' + [1 1 1]) * x2c';
"bleh1c"
rep1 = rep_transform(rep1,rot,tr);
"bleh1d"

"bleh2"
rep2 = rep_read_basin("quartz-4.basin",:,frgb="",ergb=[255 13 13],:,:,0.0025);
"bleh2a"
rot = c2x' * op2(:,1:3)' * x2c';
"bleh2b"
tr = (op2(:,4)' + [1 1 0]) * x2c';
"bleh2c"
rep2 = rep_transform(rep2,rot,tr);
"bleh2d"

"bleh3"
rep3 = rep_read_basin("quartz-7.basin",:,frgb=[128 128 128 0 0],ergb=[0 0 0],:,:,0.0025);
"bleh3a"
rot = c2x' * op3(:,1:3)' * x2c';
"bleh3b"
tr = (op3(:,4)' + [1 1 1]) * x2c';
"bleh3c"
rep3 = rep_transform(rep3,rot,tr);
"bleh3d"

## merge all of it
rep = rep_merge(rep,rep1,rep2,rep3);
"bleh4"

## write the obj -> surprisingly easy visualization with g3dviewer
## no memory problems at all
rep_write_obj(rep,"quartz_basins.obj");
save rep.who rep
"bleh5"

## orientation and povray
rep = rep_setdefaultscene_view3dscene(rep,[-6.81 -9.56 9.89],[0.55 0.79 -0.26],[0.17 0.20 0.97]);
"bleh6"

rep_write_pov(rep,"quartz_basins.pov");
run_povray("quartz_basins");

