apt update && apt install openjdk-11-jdk-headless build-essential zip unzip git -y
mkdir bazel-4.0.0-dist
curl https://github.com/bazelbuild/bazel/releases/download/4.0.0/bazel-4.0.0-dist.zip | unzip -d bazel-4.0.0-dist
bash bazel-4.0.0-dist/compile.sh
