% Ashira Sahunalu ENGR 1140 March 20, 2026
% Kinesolve.m

%  Kinematics Calculator — Solves for unknown motion variables
%  using the 4 main kinematic equations.

close all; clear; clc;

 
fprintf('⊰══════════════════════════════════════════⊱\n');
fprintf('   Kinematics Calculator — 1D Motion       \n');
fprintf('⊰══════════════════════════════════════════⊱\n\n');
 
fprintf('Enter a minimum of three values known. The other values will be solved for.\nType NaN if unknown.\n\n');
 
% ---- User Inputs ----
v0 = input('Initial velocity v0 (m/s)       : ');
vf = input('Final velocity   vf (m/s)       : ');
a  = input('Acceleration     a  (m/s^2)     : ');
t  = input('Time             t  (s)         : ');
d  = input('Displacement     d  (m)         : ');

% ---- Time Validity Check ----
if (~isnan(t) && t < 0)
    fprintf('[ERROR] Time cannot be negative. Please re-run and enter a valid time.\n');
    return;
end
 
% ---- Kinematic Equations ----
% Eq 1: vf = v0 + a*t
% Eq 2: d  = v0*t + 0.5*a*t^2
% Eq 3: vf^2 = v0^2 + 2*a*d
% Eq 4: d  = 0.5*(v0 + vf)*t

for pass = 1:5
 
    % Eq 1: vf = v0 + a*t
    if isnan(vf) && ~isnan(v0) && ~isnan(a) && ~isnan(t)
        vf = v0 + a * t;
        fprintf('[Eq 1] vf = v0 + a*t  =>  vf = %f m/s\n', vf);
    elseif isnan(v0) && ~isnan(vf) && ~isnan(a) && ~isnan(t)
        v0 = vf - a * t;
        fprintf('[Eq 1] v0 = vf - a*t  =>  v0 = %f m/s\n', v0);
    elseif isnan(a) && ~isnan(vf) && ~isnan(v0) && ~isnan(t)
        a = (vf - v0) / t;
        fprintf('[Eq 1] a = (vf - v0)/t  =>  a = %f m/s^2\n', a);
    elseif isnan(t) && ~isnan(vf) && ~isnan(v0) && ~isnan(a) && a ~= 0
        t = (vf - v0) / a;
        fprintf('[Eq 1] t = (vf - v0)/a  =>  t = %f s\n', t);
    end
 
    % Eq 2: d = v0*t + 0.5*a*t^2
    if isnan(d) && ~isnan(v0) && ~isnan(a) && ~isnan(t)
        d = v0 * t + 0.5 * a * t^2;
        fprintf('[Eq 2] d = v0*t + 0.5*a*t^2  =>  d = %f m\n', d);
    elseif isnan(v0) && ~isnan(d) && ~isnan(a) && ~isnan(t) && t ~= 0
        v0 = (d - 0.5 * a * t^2) / t;
        fprintf('[Eq 2] v0 = (d - 0.5*a*t^2)/t  =>  v0 = %f m/s\n', v0);
    end
 
    % Eq 3: vf^2 = v0^2 + 2*a*d
    if isnan(vf) && ~isnan(v0) && ~isnan(a) && ~isnan(d)
        val = v0^2 + 2 * a * d;
        if val >= 0
            vf = sqrt(val);
            fprintf('[Eq 3] vf = sqrt(v0^2 + 2*a*d)  =>  vf = %f m/s\n', vf);
        end
    elseif isnan(v0) && ~isnan(vf) && ~isnan(a) && ~isnan(d)
        val = vf^2 - 2 * a * d;
        if val >= 0
            v0 = sqrt(val);
            fprintf('[Eq 3] v0 = sqrt(vf^2 - 2*a*d)  =>  v0 = %f m/s\n', v0);
        end
    elseif isnan(a) && ~isnan(vf) && ~isnan(v0) && ~isnan(d) && d ~= 0
        a = (vf^2 - v0^2) / (2 * d);
        fprintf('[Eq 3] a = (vf^2 - v0^2)/(2*d)  =>  a = %f m/s^2\n', a);
    elseif isnan(d) && ~isnan(vf) && ~isnan(v0) && ~isnan(a) && a ~= 0
        d = (vf^2 - v0^2) / (2 * a);
        fprintf('[Eq 3] d = (vf^2 - v0^2)/(2*a)  =>  d = %f m\n', d);
    end
 
    % Eq 4: d = 0.5*(v0 + vf)*t
    if isnan(d) && ~isnan(v0) && ~isnan(vf) && ~isnan(t)
        d = 0.5 * (v0 + vf) * t;
        fprintf('[Eq 4] d = 0.5*(v0+vf)*t  =>  d = %f m\n', d);
    elseif isnan(t) && ~isnan(v0) && ~isnan(vf) && ~isnan(d) && (v0 + vf) ~= 0
        t = (2 * d) / (v0 + vf);
        fprintf('[Eq 4] t = 2*d/(v0+vf)  =>  t = %f s\n', t);
    end
 
end
 
% ---- Summary ----
fprintf('\n⊰══════════════════════════════════════════⊱\n');
fprintf('              Final Results                \n');
fprintf('⊰══════════════════════════════════════════⊱\n\n');
fprintf('  Initial Velocity  v0 = '); if ~isnan(v0), fprintf('%f m/s\n', v0);   else, fprintf('Could not solve\n'); end
fprintf('  Final Velocity    vf = '); if ~isnan(vf), fprintf('%f m/s\n', vf);   else, fprintf('Could not solve\n'); end
fprintf('  Acceleration       a = '); if ~isnan(a),  fprintf('%f m/s^2\n', a);  else, fprintf('Could not solve\n'); end
fprintf('  Time               t = '); if ~isnan(t),  fprintf('%f s\n', t);      else, fprintf('Could not solve\n'); end
fprintf('  Displacement       d = '); if ~isnan(d),  fprintf('%f m\n', d);      else, fprintf('Could not solve\n'); end
 
% ---- Motion Classifier ----
fprintf('\n⊰══════════════════════════════════════════⊱\n');
fprintf('           Motion Classification           \n');
fprintf('⊰══════════════════════════════════════════⊱\n\n');
 
if ~isnan(a)
    if a > 0
        fprintf('  >> Motion Type: ACCELERATING (a > 0)\n');
    elseif a < 0
        fprintf('  >> Motion Type: DECELERATING (a < 0)\n');
    else
        fprintf('  >> Motion Type: CONSTANT SPEED (a = 0)\n');
    end
end
 
if ~isnan(d)
    if d > 0
        fprintf('  >> Direction:   Moving in POSITIVE direction\n');
    elseif d < 0
        fprintf('  >> Direction:   Moving in NEGATIVE direction\n');
    else
        fprintf('  >> Direction:   No displacement (stationary or returned to start)\n');
    end
end

