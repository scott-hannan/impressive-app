from invoke import task
import docker


@task
def build_container_image(context):
    client = docker.from_env()
    client.images.build(path="./", tag="impressiveapp:latest", rm=True)

@task
def run_container(context):
    client = docker.from_env()
    client.containers.run(image="impressiveapp:latest", name="impressiveapp", detach=True)