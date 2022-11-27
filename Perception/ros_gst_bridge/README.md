# ROS-Gstreamer Bridge

Constructs a gstreamer pipeline with a selected ROS image topic feeding into `appsrc`.

### Configuration through rosparams:
* *pipeline_config* - Gstremaer pipeline configuration in standard formatting (omitting appsrc at the beginning)
* *image_topic* - Image topic to be fed into the pipeline

See `ros_gst_bridge.launch` for an example pipline with hardware-accelerated scaling, h265 encoding and udp streaming.

Gstreamer acceleration on Jetson: https://developer.download.nvidia.com/embedded/L4T/r32_Release_v1.0/Docs/Accelerated_GStreamer_User_Guide.pdf 

`gscam` node can be used for receiving and decoding the stream