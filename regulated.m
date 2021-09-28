function y=regulated(V,f,dc,RL)
c=47e-6;
k=(V-dc)*RL;
m=dc*(1+pi*sqrt(f*RL*c));
y=k/m;
end
