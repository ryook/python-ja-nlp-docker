# python-ja-nlp-docker
docker container for japanese nlp.

## how to use
### build

`docker build -t python-ja-nlp .`

#### use sudachi user dictionary

1. edit sudachi_config/user_dict.txt
2. `docker build -t python-ja-nlp .`

### run python

`docker run --rm --name python-nlp -it python-nlp python`

OR

`docker run --rm -v {pwd}:/home/appusr --name python-nlp -it python-nlp python hoge.py`

### run jupyter
`docker run --rm -v {pwd}:/home/appusr -p 8888:8888 --name python-nlp -it python-nlp jupyter notebook`
