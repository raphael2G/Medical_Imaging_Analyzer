# weights and biases
import wandb
from wandb_training_loop import train_model


sweep_configuration = {
    'method': 'random',
    'name': 'sweep',
    'metric': {
        'goal': 'minimize', 
        'name': 'validation_loss'
		},

    'parameters': {
        'batch_size': {'values': [16, 32, 64]},
        'n_epochs': {'values': [5, 10, 15]},
        'learning_rate': {'max': 0.1, 'min': 0.0001}, 
        'image_size': {'values': [224]}, 
        'n_channels': {'values': [3]}, 
        'patch_size': {'values': [32]},
        'projection_dim': {'values': [8]},
        'transformer_layers': {'values': [2]},
        'num_heads': {'values': [8]},
        'mlp_head_units_1': {'values': [2048]},
        'mlp_head_units_2': {'values': [1024]}
     }
}

wandb.init(project="Medical Image Segmentation", entity="raphael1")
sweep_id = wandb.sweep(sweep=sweep_configuration, project="Medical Image Segmentation")

wandb.agent(sweep_id=sweep_id, function=train_model)










