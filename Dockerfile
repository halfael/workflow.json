# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui_controlnet_aux@1.1.3
RUN comfy node install --exit-on-fail comfyui-kjnodes@1.1.9
# RUN # Skipping ComfyUI-segment-anything-2 (not available in ComfyUI registry)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Kijai/sam2-safetensors/resolve/main/sam2_hiera_base_plus.safetensors --relative-path models/checkpoints --filename sam2_hiera_base_plus.safetensors
RUN comfy model download --url https://github.com/Megvii-BaseDetection/YOLOX/releases/download/0.1.1rc0/yolox_l.onnx --relative-path models/checkpoints --filename yolox_l.onnx
RUN comfy model download --url https://huggingface.co/hr16/DWPose-TorchScript-BatchSize5/resolve/main/dw-ll_ucoco_384_bs5.torchscript.pt --relative-path models/checkpoints --filename dw-ll_ucoco_384_bs5.torchscript.pt
RUN comfy model download --url https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Wan22_relight/WanAnimate_relight_lora_fp16.safetensors --relative-path models/loras --filename WanAnimate_relight_lora_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors --relative-path models/embeddings --filename umt5_xxl_fp8_e4m3fn_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors --relative-path models/vae --filename wan_2.1_vae.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors --relative-path models/clip --filename clip_vision_h.safetensors
RUN comfy model download --url https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors --relative-path models/loras --filename lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors
RUN comfy model download --url https://huggingface.co/Kijai/WanVideo_comfy_fp8_scaled/resolve/main/Wan22Animate/Wan2_2-Animate-14B_fp8_e4m3fn_scaled_KJ.safetensors --relative-path models/diffusion_models --filename Wan2_2-Animate-14B_fp8_e4m3fn_scaled_KJ.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
