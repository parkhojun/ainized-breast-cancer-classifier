FROM pytorch/pytorch

CMD ["bash"]





WORKDIR /workspace
RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get install vim -y
RUN pip install -U pip
RUN python -m pip install -U matplotlib
RUN pip install h5py
RUN pip install opencv-python==3.4.8.29
RUN pip install scipy
RUN pip install imageio
RUN pip install pandas
RUN pip install tqdm
RUN pip install numpy
RUN apt-get install -y libsm6 libxext6 libxrender-dev
RUN apt-get install libgtk2.0-dev -y
RUN apt-get install libglfw3-dev libgles2-mesa-dev -y
RUN git clone https://github.com/parkhojun/ainized-breast_cancer_classifier.git
WORKDIR /workspace/ainized-breast_cacncer_classifier/

RUN rm -rf node_modules && npm install

COPY package.json .
RUN npm install
RUN npm install sync-exec

COPY . .
EXPOSE 80
ENTRYPOINT app.js

