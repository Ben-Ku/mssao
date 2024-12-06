
struct Globals {
    mvp_transform: mat4x4<f32>,   
};

var<uniform> globals: Globals;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    normal: vec3<f32>
};

struct Vertex {
    pos: vec3<f32>,
    normal: vec3<f32>,
};

@vertex
fn vs_main(vertex: Vertex) -> VertexOutput {
    var pos = vec4(vertex.pos, 1.0);

    pos = globals.mvp_transform * pos;
    // return VertexOutput(pos);
    // let vs_out = VertexOutput(pos, vertex.normal);
    let vs_out = VertexOutput(pos, vec3(1.0));
    return vs_out;
}

@fragment
fn fs_main(vertex: VertexOutput) -> @location(0) vec4<f32> {

    var light_dir = vec3(1.0,2.0,3.0);
    light_dir = normalize(light_dir);

    // let d = dot(vertex.position.xyz, light_dir);
    let d = 0.2;
    // return vec4(d,d,d,1.0);
    return vec4(1.0,0.0,0.0,1.0);
}