from matplotlib import pyplot as plt
from datetime import datetime

# handle plotting loss vs accuracy
def plot_data(loss_history, accuracy_history):
    plt.plot(loss_history, label='loss')
    plt.plot(accuracy_history, label='accuracy') 
    plt.legend()
    plt.xlabel('Epochs')
    plt.ylabel('Accuracy/Loss')
    plt.show()


# handle run time
def monitor_runtime():
    return datetime.now()

def monitor_runtime(start_time, formatted=True, with_start=False):

    end_time = datetime.now()
    elapsed = end_time - start_time

    if formatted: 
        elapsed = ''

    if with_start: 
        return 'need to implement tracking time. see util file', end_time
        
    return 'need to implement tracking time. see util file'
