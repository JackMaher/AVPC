
package;

import openfl.display.Shader;

class Taper extends Shader
{

    @fragment var code = '

        uniform vec2 iResolution;
        uniform vec2 native;
        uniform float time;
        float speed = 1.0;

        float rand(vec2 co){
            return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
        }

        void main() {

            vec2 scale = iResolution/native;

            vec2 coord = ${Shader.vTexCoord}; // Copy for editing
            vec4 color = texture2D(${Shader.uSampler}, coord);

            if(color == vec4(1,1,1,1)) {
                gl_FragColor = vec4(1,1,1,1);
            }

            else {

                vec2 offset = scale / 2.0;

                float sf = coord.y;

                coord.x = (coord.x-offset.x)/(0.5+sf)*(0.85)  +offset.x; // Scale x based on y (trapezium)

                if(native.y == 1024.0) {
                    coord.y = pow(coord.y*0.85,0.7);
                }
                else {
                    coord.y = pow(coord.y*0.7,0.7);
                }
                vec4 color = texture2D(${Shader.uSampler}, coord);

                if(color.r == color.g && color.r == color.b) {
                    float dx = (${Shader.vTexCoord}.x - scale.x/2.0);
                    float dy = (${Shader.vTexCoord}.y - scale.y/2.0);
                    float r2 = dx*dx+dy*dy;
                    float at = round(atan(dy,dx)*300.0) / 300.0;

                    color = vec4((mod(r2 - time * speed + rand(vec2(0.0,at))*9.0, 9.0)-8.8)*sqrt(r2*4.0));
                }

                gl_FragColor = color;
            }
        }
    ';

    public function new()
    {
        super();
    }
}
