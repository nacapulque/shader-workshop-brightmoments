precision mediump float;

varying vec2 vUv;

void main() {  
  vec2 uv = vUv;
  
  vec3 color = vec3(1.0);


  //////////////////////////////////////////
  // COLORES
  //////////////////////////////////////////

  vec3 c1 = vec3(0.0); // negro
  vec3 c2 = vec3(1.0); // blanco
  vec3 c3 = vec3(1.0, 0.0, 0.0); // rojo
  vec3 c4 = vec3(0.0, 1.0, 0.0); // verde
  vec3 c5 = vec3(0.0, 0.0, 1.0); // azul


  //////////////////////////////////////////
  // GEOMETRIAS BASICAS
  //////////////////////////////////////////

  // CIRCULO
  // Mover geometria en el espacio - dentro de abs (Ejemplo: vec2(uv.x + 0.5, uv.y - 0.3))
  float circ = length(uv);
  // Function de step(borde, x)
  // Si x < borde ? 0.0 es resultado (negro) : de lo contrario 1.0 (blanco) 
  circ = step(0.25, circ);
  color += circ;

  // RECTANGULO O CUADRADO
  // Mover geometria en el espacio - dentro de abs (Ejemplo: uv.x + 0.2)
  // Expandir o reducir geometria rectangular - fuera de abs (Ejemplo: abs(uv.x) + 0.2)
  float rect = max(
      abs(uv.x),
      abs(uv.y)
  );
  rect = step(0.25, rect);
  color += rect;


  // TRIANGULO
  // Mover geometria en el espacio - mover uv antes de definir geometria (Ejemplo: uv.x += 0.2)
  float tDiam = 0.5;
  float trian = max(
      abs(uv.x) + uv.y * tDiam,
      uv.y * -tDiam 
  );
  trian = step(0.1, trian);
  color += trian;



  gl_FragColor = vec4(color, 1.0);
}