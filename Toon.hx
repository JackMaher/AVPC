
package;

import openfl.display.Shader;

class Toon extends Shader
{

    @fragment var code = '
uniform float     iTime;       // shader playback time (in seconds)
uniform vec3      iResolution; // viewport resolution (in pixels)


float lookup(vec2 p, float dx, float dy)
{
    vec2 uv = (p.xy + vec2(dx/1920.0, dy /1080.0));
    vec4 c = texture2D(${Shader.uSampler}, uv);

    // return as luma
    return 0.2126*c.r + 0.7152*c.g + 0.0722*c.b;
}

void main() {

    vec2 p = ${Shader.vTexCoord};

    // simple sobel edge detection
    float gx = 0.0;
    gx += -1.0 * lookup(p, -1.0, -1.0);
    gx += -2.0 * lookup(p, -1.0,  0.0);
    gx += -1.0 * lookup(p, -1.0,  1.0);
    gx +=  1.0 * lookup(p,  1.0, -1.0);
    gx +=  2.0 * lookup(p,  1.0,  0.0);
    gx +=  1.0 * lookup(p,  1.0,  1.0);

    float gy = 0.0;
    gy += -1.0 * lookup(p, -1.0, -1.0);
    gy += -2.0 * lookup(p,  0.0, -1.0);
    gy += -1.0 * lookup(p,  1.0, -1.0);
    gy +=  1.0 * lookup(p, -1.0,  1.0);
    gy +=  2.0 * lookup(p,  0.0,  1.0);
    gy +=  1.0 * lookup(p,  1.0,  1.0);

    float g = gx*gx + gy*gy;

    vec4 col = texture2D(${Shader.uSampler}, p);
    if(g > 0.3) {
    col = vec4(0.0, 0.0, 0.0, 1.0);
    }

    gl_FragColor = col;
}
    ';

    public function new()
    {
        super();
    }
}
