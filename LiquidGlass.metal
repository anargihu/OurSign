#include <metal_stdlib>
using namespace metal;

[[ stitchable ]]
half2 liquidGlass(
    float2 position,
    float2 size,
    float time,
    float strength
) {
    float2 uv = position / size;

    float2 p = uv * 3.14159265;

    float x = sin(p.y * 7.0 + time) * 0.004;
    float y = cos(p.x * 6.0 + time * 0.8) * 0.004;

    return half2(float2(x, y) * strength);
}
