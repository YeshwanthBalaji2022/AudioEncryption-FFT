# Audio Encryption and Decryption using FFT

This MATLAB script provides a simple demonstration of audio encryption and decryption using the Fast Fourier Transform (FFT) technique. The script takes an input audio file, divides it into blocks, applies FFT to each block, and then encrypts the audio by adding a key to the FFT coefficients. Similarly, decryption is performed by subtracting the key from the encrypted FFT coefficients. 

## Getting Started

### Prerequisites

To run this script, you need MATLAB installed on your system.

### Usage

1. Clone the repository to your local machine.
2. Place your audio file (preferably in .wav format) in the same directory as the MATLAB script.
3. Update the `file_example_WAV_2MG.wav` in the script to your audio file's name, if necessary.
4. Set the encryption key (`key`) and block size (`block_size`) in the script.
5. Run the script in MATLAB.

## Functionality

- `encrypt_audio`: Function to encrypt the input audio using FFT and a provided encryption key.
- `decrypt_audio`: Function to decrypt the encrypted audio using FFT and the same encryption key.

## Results

The script generates three plots:
1. Original audio waveform
2. Encrypted audio waveform
3. Decrypted audio waveform

Each plot displays the audio waveform in the time domain. Additionally, three corresponding plots are generated to show the frequency spectra of the original, encrypted, and decrypted audio signals.

## Contributing

Contributions are welcome! If you have any ideas for improvements or find any issues, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- The encryption and decryption techniques used in this script are for educational purposes and may not be suitable for real-world applications.

