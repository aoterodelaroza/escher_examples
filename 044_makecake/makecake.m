#! /usr/bin/octave-cli -q

## Input
graphcushion = 2.5; ## cushion around graphene, each side, in angstrom
nx = 4; ## number of super-cells in the x direction (1 s.c. length ~ 24 bohr)
ny = 4; ## number of super-cells in the x direction (1 s.c. length ~ 24 bohr)
nice = 3; ## number of ice layers in the cake

## Read the structures
crg = crg0 = cr_read_espresso("graphite-b86b.scf.out");
cri = cri0 = cr_read_espresso("ice6-b86b.scf.out");

## Transform graphite into the orthogonal cell
crg = cr_newcell(crg,[1 0 0],[1 2 0],[0 0 1]);

## ## Transform both to the supercell
cri = cr_newcell(cri,[2 0 0],[0 2 0],[0 0 1]);
crg = cr_newcell(crg,[5 0 0],[0 3 0],[0 0 1]);

## Translate ice-VI to make whole molecules
cri = cr_moveorigin(cri,[0.05 -0.30 -0.05]); 

## Take only one graphene, center it
crg = cr_insertvacuum(crg,3,2*graphcushion/0.529-crg.a(3),[0 0.5]);
crg.x(:,3) = 0.5;

## Save these supercells to a file
## save makecake.who cri crg 
## load makecake.who

aavg = mean([cri.a(1:2) crg.a(1:2)]);

## All the cake crystal information, except the coordinates
cr = crystal_();
cr.name = "cake";
cr.ntyp = 3;
cr.attyp = {"H","O","C"};
cr.ztyp = [1 8 6];
cr.b = [90 90 90] * pi /180;
cr.a = [aavg*nx, aavg*ny, 2*crg.a(3) + nice*cri.a(3)];
cr = cr_fill_rg(cr);

## Coordinates for the bottom layer
z0 = 0.;
n = 0;
for i = 1:nx
  for j = 1:ny
    x0 = [(i-1) / nx, (j-1)/ny, z0];
    for k = 1:crg.nat
      n++;
      cr.x(n,:) = x0 + [crg.x(k,1)/nx, crg.x(k,2)/ny, crg.x(k,3) * crg.a(3) / cr.a(3)];
      cr.typ(n) = 3;
    endfor
  endfor
endfor
cr.nat = n;
z0 += crg.a(3)/cr.a(3);

## The ice layers
for m = 1:nice
  n = cr.nat;
  for i = 1:nx
    for j = 1:ny
      x0 = [(i-1) / nx, (j-1)/ny, z0];
      for k = 1:cri.nat
        n++;
        cr.x(n,:) = x0 + [cri.x(k,1)/nx, cri.x(k,2)/ny, cri.x(k,3) * cri.a(3) / cr.a(3)];
        cr.typ(n) = cri.typ(k);
      endfor
    endfor
  endfor
  cr.nat = n;
  z0 += cri.a(3)/cr.a(3);
endfor

## Coordinates for the top layer
n = cr.nat;
for i = 1:nx
  for j = 1:ny
    x0 = [(i-1) / nx, (j-1)/ny, z0];
    for k = 1:crg.nat
      n++;
      cr.x(n,:) = x0 + [crg.x(k,1)/nx, crg.x(k,2)/ny, crg.x(k,3) * crg.a(3) / cr.a(3)];
      cr.typ(n) = 3;
    endfor
  endfor
endfor
cr.nat = n;
z0 += crg.a(3)/cr.a(3);

## cr_write_espresso(cr,"cake.scf.in")
mol = cr_dumpmol(cr);
mol_writexyz(mol,"cake.xyz");

