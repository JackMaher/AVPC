
package;

import openfl.display.Shader;

class Taper extends Shader
{

    @fragment var code = '

        void main() {

            vec2 coord = ${Shader.vTexCoord};
            vec4 color = texture2D(${Shader.uSampler}, coord);
            if(color == vec4(1,1,1,1)) {
                gl_FragColor = vec4(1,1,1,1);
            }
            else {

                float sf = coord.y;
                coord.x = (coord.x-0.325)/(0.5+sf) +0.325;

                if(coord.x == 0.0) {
                    gl_FragColor = vec4(0,0,0,1);
                }
                else {
                    coord.y = pow(coord.y*0.9,0.7);
                    vec4 color = texture2D(${Shader.uSampler}, coord);

                    gl_FragColor = color;
                }
            }

        }

    ';

    public function new()
    {
        super();
    }
}
