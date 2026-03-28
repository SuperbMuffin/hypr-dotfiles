#version 300 es
precision mediump float;

in vec2 v_texcoord;
out vec4 FragColor;
uniform sampler2D tex;

void main() {
    vec4 color = texture(tex, v_texcoord);

    // simple darken to test
    color.rgb *= 0.85;

    FragColor = color;
}
