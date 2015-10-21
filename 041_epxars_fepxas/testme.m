#! /usr/bin/octave -q

## epxars
## find the crystal mask using epxars_o_as_h
cr = cr_read_espresso("epxars_o_as_h.scf.out",0);
[mol mask] = cr_crystalbox(cr,[-1.05 -2.05 -0.55],[1.05 1.05 1.55],23);

## run over all the crystals and apply the mask
xa1 = {"o","s"};
xa2 = {"as","sb"};
xa3 = {"h","f"};
for i1 = 1:length(xa1)
  a1 = xa1{i1};
  for i2 = 1:length(xa2)
    a2 = xa2{i2};
    for i3 = 1:length(xa3)
      a3 = xa3{i3};
      name = sprintf("epxars_%s_%s_%s",a1,a2,a3);
      disp(name);
      cr = cr_read_espresso(sprintf("%s.scf.out",name),0);
      mol = cr_applymask(cr,mask);
      rep = representation_();
      rep = mol_ball(mol,rep);
      rep = mol_stick(mol,rep);
      rep_write_obj(rep,sprintf("%s.obj",name));
      rep = rep_setdefaultscene_view3dscene(rep,[-24 -4 0],[1.0 0 0.22],[0.22 0 -1]);
      rep_write_pov(rep,sprintf("%s.pov",name));
      system(sprintf("povray -D -UV +I%s.pov +O%s.png +W1500 +H1500 +A 2> /dev/null",name,name));
    endfor
  endfor
endfor

## fepxas
## find the crystal mask using fepxas_o_as_h
cr = cr_read_espresso("fepxas_o_as_f.scf.out",0);
[mol mask] = cr_crystalbox(cr,[0.0 -0.75 -1.55],[0.75 0.75 2.55],23);

## run over all the crystals and apply the mask
xa1 = {"o","s"};
xa2 = {"as","sb"};
xa3 = {"h","f"};
for i1 = 1:length(xa1)
  a1 = xa1{i1};
  for i2 = 1:length(xa2)
    a2 = xa2{i2};
    for i3 = 1:length(xa3)
      a3 = xa3{i3};
      name = sprintf("fepxas_%s_%s_%s",a1,a2,a3);
      disp(name);
      cr = cr_read_espresso(sprintf("%s.scf.out",name),0);
      mol = cr_applymask(cr,mask);
      rep = representation_();
      rep = mol_ball(mol,rep);
      rep = mol_stick(mol,rep);
      rep_write_obj(rep,sprintf("%s.obj",name));
      rep = rep_setdefaultscene_view3dscene(rep,[-15 2.5 0],[1 0 0],[0 1 0]);
      rep_write_pov(rep,sprintf("%s.pov",name));
      system(sprintf("povray -D -UV +I%s.pov +O%s.png +W1500 +H1500 +A 2> /dev/null",name,name));
    endfor
  endfor
endfor
