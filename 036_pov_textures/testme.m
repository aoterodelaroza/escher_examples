#! /usr/bin/octave -q

global texdb

tex_dbstart();
rep = representation_();
for i = 1:length(texdb)
  if (strcmp(texdb{i}.typ,"pov"))
    printf("%3d : %s\n",i,texdb{i}.name);
    [rep idx] = rep_registertexture(rep,texdb{i}.name);
    n = rep.nball = rep.nball + 1;
    rep.ball{n}.x = [2*(i-1), 0, 0];
    rep.ball{n}.r = 0.9;
    rep.ball{n}.rgb = [255 0 0];
    rep.ball{n}.tex = idx;
    n = rep.nball = rep.nball + 1;
    rep.ball{n}.x = [2*(i-1), 3, 0];
    rep.ball{n}.r = 0.9;
    rep.ball{n}.rgb = [0 255 0];
    rep.ball{n}.tex = idx;
    n = rep.nball = rep.nball + 1;
    rep.ball{n}.x = [2*(i-1), 6, 0];
    rep.ball{n}.r = 0.9;
    rep.ball{n}.rgb = [0 0 255];
    rep.ball{n}.tex = idx;
  endif
endfor

rep = rep_setdefaultscene(rep);
rep_write_pov(rep,"textures.pov");
run_povray("textures");

