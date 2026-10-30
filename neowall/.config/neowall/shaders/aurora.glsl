#define TAU 6.2831853071

// Procedural 2D Noise to replace Shadertoy's iChannel texture dependencies
float hash(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

float proceduralNoise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    
    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));
    
    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;
    
    // Smooth mathematical noise instead of pulling from broken texture files
    float o = proceduralNoise(uv * 4.0 + vec2(0.0, iTime * 0.1));
    float d = proceduralNoise(uv * 4.0 - vec2(0.0, iTime * 0.08 + o * 0.08)) * 2.0 - 1.0;
    
    float v = uv.y + d * 0.1;
    v = 1.0 - abs(v * 2.0 - 1.0);
    
    float waveExponent = max(0.1, 2.0 + sin((iTime * 0.2 + d * 0.25) * TAU) * 0.5);
    v = pow(max(0.0, v), waveExponent);
    
    vec3 color = vec3(0.0);
    
    float x = (1.0 - uv.x * 0.75);
    float y = 1.0 - abs(uv.y * 2.0 - 1.0);
    color += vec3(x * 0.5, y, x) * v;
    
    // High-fidelity grain seed setup
    vec2 seed = fragCoord.xy / iResolution.xy; 
    vec2 r;
    r.x = fract(sin(dot(seed, vec2(12.9898, 78.233))) * 43758.5453123);
    r.y = fract(sin(dot(seed, vec2(53.7842, 47.5134))) * 43758.5453123);

    float s = mix(r.x, (sin((iTime * 2.5 + 60.0) * r.y) * 0.5 + 0.5) * pow(r.y, 4.0), 0.04); 
    
    color += pow(max(0.0, s), 70.0) * (1.0 - v);
    
    fragColor.rgb = clamp(color, 0.0, 1.0);
    fragColor.a = 1.0;
}

