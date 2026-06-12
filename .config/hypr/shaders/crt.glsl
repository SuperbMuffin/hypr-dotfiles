#version 300 es
precision mediump float;

in vec2 v_texcoord;
out vec4 FragColor;

uniform sampler2D tex;
uniform vec2 screen_size;

void main() {
    vec2 uv = v_texcoord;

    // === Much weaker curvature (less black borders) ===
    vec2 dc = abs(0.5 - uv);
    dc *= dc;
    uv += (uv - 0.5) * (dc.x + dc.y) * 0.065;   // lowered from 0.12 → 0.065

    // Sample color
    vec4 color = texture(tex, uv);

    // === Mild Scanlines (full screen) ===
    float scan = sin(uv.y * screen_size.y * 3.14159 * 2.0);
    color.rgb *= 0.94 + scan * 0.06;

    // === Subtle RGB separation ===
    color.r = mix(color.r, texture(tex, uv + vec2(0.0012, 0.0)).r, 0.10);
    color.b = mix(color.b, texture(tex, uv - vec2(0.0012, 0.0)).b, 0.10);

    // === Soft Vignette ===
    float vignette = 1.0 - dot(dc, dc) * 0.35;
    color.rgb *= vignette;

    // === Light Sharpen (helps reduce font bleed) ===
    vec4 center = texture(tex, uv);
    vec4 left   = texture(tex, uv - vec2(0.0015, 0.0));
    vec4 right  = texture(tex, uv + vec2(0.0015, 0.0));
    color.rgb = center.rgb * 1.8 - (left.rgb + right.rgb) * 0.4;

    // === Contrast & Brightness ===
    color.rgb = (color.rgb - 0.5) * 1.10 + 0.5;
    color.rgb *= 1.04;

    FragColor = vec4(color.rgb, 1.0);
}
