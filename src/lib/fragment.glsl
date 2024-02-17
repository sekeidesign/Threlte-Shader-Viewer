// #version 330 core

uniform float uTime;
varying vec2 vUv;
uniform vec2 uMouse;
uniform vec2 uResolution;

void main(void)
{
    // Rename the uniform
    vec2 uv=vUv;
    
    vec4 color=vec4(vUv,1.,1.);
    gl_FragColor=color;
}