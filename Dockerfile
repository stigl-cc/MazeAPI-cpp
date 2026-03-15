FROM alpine AS build
WORKDIR /code/
RUN apk add --no-cache libjpeg-turbo-dev make cmake gcc g++
COPY . /code/
RUN cmake -D CMAKE_BUILD_TYPE=Release -B ./build/Release -S . && \
    cmake --build ./build/Release --config Release && \
    mkdir -pv /code/install && \
    cmake --install ./build/Release --prefix /code/install --verbose

FROM alpine AS publish
RUN apk add --no-cache libjpeg-turbo libstdc++ libgcc
COPY --from=build /code/install/bin /install
EXPOSE 8080

CMD [ "/install/maze_api_cpp" ]
