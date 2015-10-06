#! /usr/bin/octave -q

# from critic2:
r0 = [-0.049476    9.251742    3.323199];
r1 = [-0.203016    1.904580    3.323199];
r2 = [ 7.297686    9.098202    3.323199];

# build polygon
plane = zeros(4,3);
plane(1,:) = r0 * .52917720859;
plane(2,:) = r1 * .52917720859;
plane(3,:) = (r1 + (r2-r0)) * .52917720859;
plane(4,:) = r2 * .52917720859;
pcm = (r0 + r1 / 2 + r2 / 2) * .52917720859;

# plot it
mol = mol_readxyz("h2o_h2o.xyz");
rep = mol_ball(mol);
rep = mol_stick(mol,rep);
rep = mol_stick(mol,rep,"O","H",[1.8,2.0],:,0.01,[0 255 0]);
rep = rep_polygon(rep,plane);
rep_write_obj(rep,"h2o_h2o.obj");

rep = rep_setdefaultscene_view3dscene(rep,[1.71 2.76 8.40],[0 0 -1],[0 1 0]);
rep_write_pov(rep,"h2o_h2o.pov");
run_povray("h2o_h2o")

# from critic2:
r0 = [5.934430    0.000000    0.000000];
r1 = [5.934430   13.228100    0.000000];
r2 = [5.934430    0.000000   11.243885];

# build polygon
plane = zeros(4,3);
plane(1,:) = r0 * .52917720859;
plane(2,:) = r1 * .52917720859;
plane(3,:) = (r1 + (r2-r0)) * .52917720859;
plane(4,:) = r2 * .52917720859;
pcm = (r0 + r1 / 2 + r2 / 2) * .52917720859;

# plot it
mol = mol_readxyz("c6h6_c6h6.xyz");
rep = mol_ball(mol);
rep = mol_stick(mol,rep);
rep = rep_polygon(rep,plane);
rep_write_obj(rep,"c6h6_c6h6.obj");

rep = rep_setdefaultscene_view3dscene(rep,[9.72 12.65 8.31],[-0.53 -0.73 -0.43],[-0.23 -0.36 0.90]);
rep_write_pov(rep,"c6h6_c6h6.pov");
system("povray -D -UV +Ic6h6_c6h6.pov +Oc6h6_c6h6.png +W1000 +H1000 +A");