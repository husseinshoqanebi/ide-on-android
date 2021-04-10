version="4.0.0"
apt update && apt install openjdk-11-jdk-headless build-essential zip unzip git -y
mkdir bazel-${version}-dist
curl https://github.com/bazelbuild/bazel/releases/download/${version}/bazel-${version}-dist.zip | unzip -d bazel-${version}-dist
bash bazel-${version}-dist/compile.sh
