// Define la precisión de bits de los números de punto flotante
precision mediump float;

uniform float uTime;

varying vec2 vUv;

void main(){
  
  vec2 uv = vUv;
  
  float fr = 350.0;
  float speed = 10.0;
  
  
  float wave = sin((uv.x * uv.y) * fr + uTime * speed) * 0.5 + 0.5;
  
  uv.x = 1.0 - uv.x;
  float wave2 = cos((uv.y * uv.x) * fr + uTime* speed) * 0.5 + 0.5;
  
  
  vec4 color = vec4(0.0);
  color.r = wave;
  color.g = wave2;
  
  
  // RGBA
  gl_FragColor = color;
}
