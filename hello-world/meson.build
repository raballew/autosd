project(
    'hello-world',
    'c',
    version: '0.1',
    default_options: ['warning_level=3', 'buildtype=debugoptimized'],
)

exe = executable('hello_world', 'hello_world.c', install: true)

test('basic', exe)
