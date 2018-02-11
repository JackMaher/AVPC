
package;

import openfl.display.Shader;

class Taper extends Shader
{

    @fragment var code = '

        void main() {

            vec2 coord = ${Shader.vTexCoord};

            float sf = coord.y;
            coord.y = pow(coord.y*0.9,0.7); 
            coord.x = (coord.x-0.325)/(0.5+sf) +0.325;

            vec4 color = texture2D(${Shader.uSampler}, coord);

            float f = coord.y * 20.0;
            gl_FragColor = color;

        }

    ';

    public function new()
    {
        super();
    }
}
