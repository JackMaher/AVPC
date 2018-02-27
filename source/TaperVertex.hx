package;

import openfl.display.Shader;

class TaperVertex extends Shader
{

    @fragment var code = '

        void main() {

            gl_FragColor = texture2D(${Shader.uSampler}, ${Shader.vTexCoord}.xy);

        }
    ';

    @vertex var vertCode = '
        mat3 rot = mat3 (  1.0000000,  0.0000000,  0.0000000,
                           0.0000000,  0.7071068, -0.7071068,
                           0.0000000,  0.7071068,  0.7071068 );

        void main() {
            vec3 scaledPos = ${Shader.uProjectionMatrix} * vec3(${Shader.aPosition}, 0.) + vec3(-1.0,1.0,0.0);

            //vec3 projectedCoords = ${Shader.uProjectionMatrix} * vec3(${Shader.aPosition}, 0.) + vec3(-1.0,1.0,r.0);

            scaledPos = rot * scaledPos;
            scaledPos.x *= (scaledPos.z+1.5/0.7071);

            //vec4 mul = projmat(90.0,1.0,-1.0) * vec4(projectedCoords,1.0);

            // divide through by w to get 3d

            gl_Position = vec4(scaledPos, 1.0);

            // pass through the texture coordinate
            ${Shader.vTexCoord} = ${Shader.aTexCoord} * scaledPos.xy;

        }

    ';

    public function new()
    {
        super();
    }
}
