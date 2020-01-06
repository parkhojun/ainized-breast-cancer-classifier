FROM pytorch/pytorch

CMD ["bash"]

COPY package.json .

RUN apt-get update
RUN apt get install vim -y
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
RUN git clone https://github.com/nyukat/breast_cancer_classifier.git

COPY . .
EXPOSE 80
ENTRYPOINT node server.js