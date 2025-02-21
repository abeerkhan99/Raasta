import firebase_admin
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
import numpy as np
import itertools
from firebase_admin import credentials
from firebase_admin import db
from scipy import signal

# def filter(data, fs=10, fc=2.0, order=11):
#     # fc = frequency cutoff
#     w = fc / (fs / 2) # Normalize the frequency
#     b, a = signal.butter(order, w, 'highpass', analog=False)
#     return signal.filtfilt(b, a, data)

def get_data():

    GOOGLE_APPLICATION_CREDENTIALS="raasta-c542d-firebase-adminsdk-5v3pa-94bf94e3fb.json"

    cred_obj = credentials.Certificate(GOOGLE_APPLICATION_CREDENTIALS)
    default_app = firebase_admin.initialize_app(cred_obj, {'databaseURL':"https://raasta-c542d-default-rtdb.asia-southeast1.firebasedatabase.app/"})

    ref = db.reference("/sensor-data/")
    session_data = list(ref.get().values())

    accelerometer_x = []
    accelerometer_y = []
    accelerometer_z = []
    gyroscope_x = []
    gyroscope_y = []
    gyroscope_z = []
    timestamps = []
    latitude = []
    longitude = []
    labels = []

    new_acc_x = []
    new_acc_y = []
    new_acc_z = []

    for session in session_data:

        for key in sorted(session):
            
            try:
                labels.append(session[key]['label'])
            except:
                pass

            try:
                timestamps.append(session[key]['timestamps'])
            except KeyError:
                timestamps.append(0)

            try:
                accelerometer_x.append(float(session[key]['accelerometer-x']))
            except KeyError:
                accelerometer_x.append(0.0)

            try:
                accelerometer_y.append(float(session[key]['accelerometer-y']))
            except KeyError:
                accelerometer_y.append(0.0)

            try:
                accelerometer_z.append(float(session[key]['accelerometer-z']))
            except KeyError:
                accelerometer_z.append(0.0)
            
            try:
                gyroscope_x.append(float(session[key]['gyroscope-x']))
            except KeyError:
                gyroscope_x.append(0.0)

            try:
                gyroscope_y.append(float(session[key]['gyroscope-y']))
            except KeyError:
                gyroscope_y.append(0.0)

            try:
                gyroscope_z.append(float(session[key]['gyroscope-z']))
            except KeyError:
                gyroscope_z.append(0.0)
            
            try:
                latitude.append(float(session[key]['latitude']))
            except KeyError:
                latitude.append(0)

            try:
                longitude.append(float(session[key]['longitude']))
            except KeyError:
                longitude.append(0)


    # latitude = list(filter(lambda num: num != 0, latitude))
    # longitude = list(filter(lambda num: num != 0, longitude))
    # for index in range(len(accelerometer_x)):
    #     alpha = np.arctan(accelerometer_y[index]/accelerometer_z[index])
    #     beta = np.arctan((-accelerometer_x[index]) / np.sqrt((accelerometer_y[index]**2) + (accelerometer_z[index]**2)))

    #     new_x = (np.cos(beta) * accelerometer_x[index]) + (np.sin(beta) * np.sin(alpha) * accelerometer_y[index]) + (np.cos(alpha) * np.sin(beta) * accelerometer_z[index])
    #     new_y = (np.cos(alpha) * accelerometer_y[index]) - (np.sin(alpha) * accelerometer_z[index])
    #     new_z = (-np.sin(beta) * accelerometer_x[index]) + (np.cos(beta) * np.sin(alpha) * accelerometer_y[index]) + (np.cos(beta) * np.cos(alpha) * accelerometer_z[index])

    #     new_acc_x.append(new_x)
    #     new_acc_y.append(new_y)
    #     new_acc_z.append(new_z)
    # accelerometer_x = accelerometer_x
    # accelerometer_y = accelerometer_y
    # accelerometer_z = accelerometer_z


    # accelerometer_x = filter(accelerometer_x)
    # accelerometer_y = filter(accelerometer_y)
    # accelerometer_z = filter(accelerometer_z)
    # gyroscope_x = filter(gyroscope_x)
    # gyroscope_y = filter(gyroscope_y)
    # gyroscope_z = filter(gyroscope_z)

    # print("grad applied")
    # accelerometer_x = np.gradient(accelerometer_x)
    # accelerometer_y = np.gradient(accelerometer_y)
    # accelerometer_z = np.gradient(accelerometer_z)
    # gyroscope_x = np.gradient(gyroscope_x)
    # gyroscope_y = np.gradient(gyroscope_y)
    # gyroscope_z = np.gradient(gyroscope_z)

    return [[[a,b,c,d,e,f],label] for a,b,c,d,e,f,label in zip(accelerometer_x, accelerometer_y, accelerometer_z, gyroscope_x, gyroscope_y, gyroscope_z, labels)], longitude, latitude