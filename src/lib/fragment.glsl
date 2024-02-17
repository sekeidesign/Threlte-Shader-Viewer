// #version 330 core

uniform float uTime;
varying vec2 vUv;
uniform vec2 uMouse;
uniform vec2 uResolution;

void main(void)
{
    // Rename the uniform
    vec2 uv=vUv;
    
    // Normalize the mouse coordinates
    vec2 mouse=uMouse/uResolution;
    
    vec4 color=vec4(vUv*mouse,1.*mouse.y,1.);
    gl_FragColor=color;
}