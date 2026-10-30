const float PI = 3.14159265;

vec2 tri(vec2 p) { return 1.- abs(p*.25 - round(p*.25))*4.; }

vec2 tribulence(vec2 p)
{
    float angle = 2.399; // Approx golden angle
    float c = cos(angle), s = sin(angle);
    mat2 R = mat2(c,s,-s,c);
    for(float i = 5e-4; i < 9.; i+=i)
    {
        p += tri(p.yx / i + iTime*.2)*i *.8;
        p *= R;
    }
    return p;
}

vec3 cmap(float x)
{
    return 0.5 + 0.5*cos(iTime+PI*x+vec3(1,2,3));
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (2. * fragCoord - iResolution.xy)/iResolution.y;

    vec2 p = tribulence(uv);

    vec3 color = cmap(p.x);
    
    color = 1.-exp(-1.5*color*color*color);
    color = pow(color, vec3(1./2.2));
    fragColor = vec4(color, 1);
}
