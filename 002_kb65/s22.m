#! /usr/bin/octave -q

list = {"nh3_nh3","h2o_h2o","h2co2_h2co2","formamide_formamide",...
        "uracil_uracil_hb","pyridoxine_aminopyridine","adenine_thymine_wcc1",...
        "ch4_ch4","c2h4_c2h4","c6h6_ch4","c6h6_c6h6_pd","pyrazine_pyrazine",...
        "uracil_uracil_stack","indole_c6h6_stack","adenine_thymine_stack",...
        "c2h4_c2h2","c6h6_h2o","c6h6_nh3","c6h6_hcn","c6h6_c6h6_t",...
        "indole_c6h6_t","phenol_phenol"};

for i = 1:length(list)
  mol = mol_readxyz(sprintf("%s.xyz",list{i}));
  rep = mol_ball(mol);
  rep = mol_stick(mol,rep);
  rep = rep_setdefaultscene_tessel(rep,:,"direct-noshadow");
  name = sprintf("%2.2d_%s",i,list{i});
  rep_write_pov(rep,sprintf("%s.pov",name));
  run_povray(name);
endfor
