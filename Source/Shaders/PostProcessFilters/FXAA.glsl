varying vec2 v_textureCoordinates;

uniform sampler2D u_colorTexture;

const float fxaaQualitySubpix = 0.5;
const float fxaaQualityEdgeThreshold = 0.125;
const float fxaaQualityEdgeThresholdMin = 0.0833;

void main()
{
    vec2 fxaaQualityRcpFrame = vec2(1.0) / czm_viewport.zw;
    vec4 color = FxaaPixelShader(
        v_textureCoordinates,
        u_colorTexture,
        fxaaQualityRcpFrame,
        fxaaQualitySubpix,
        fxaaQualityEdgeThreshold,
        fxaaQualityEdgeThresholdMin);
    float alpha = texture2D(u_colorTexture, v_textureCoordinates).a;
    gl_FragColor = vec4(color.rgb, alpha);
}
