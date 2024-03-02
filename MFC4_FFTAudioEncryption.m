clc;clear all;close all

[input_audio, Fs] = audioread('file_example_WAV_2MG.wav');
key = 12345;
block_size = 1024;

encrypted_audio = encrypt_audio(input_audio, key, block_size);
decrypted_audio = decrypt_audio(encrypted_audio, key, block_size);

time = (0:length(input_audio)-1) / Fs;

figure;
subplot(3,2,1);
plot(time, input_audio);
title('Original Audio');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,2,3);
plot(time, encrypted_audio);
title('Encrypted Audio');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,2,5);
plot(time, decrypted_audio);
title('Decrypted Audio');
xlabel('Time (s)');
ylabel('Amplitude');

nfft = 2^nextpow2(length(input_audio));
frequencies = linspace(0, Fs/2, nfft/2 + 1);

original_fft = fft(input_audio, nfft);
encrypted_fft = fft(encrypted_audio, nfft);
decrypted_fft = fft(decrypted_audio, nfft);

subplot(3,2,2);
plot(2/nfft * abs(original_fft(1:nfft/2 + 1)),frequencies);
title('Original Audio Spectrum');
ylabel('Frequency (Hz)');
xlabel('Amplitude');

subplot(3,2,4);
plot(2/nfft * abs(encrypted_fft(1:nfft/2 + 1)),frequencies);
title('Encrypted Audio Spectrum');
ylabel('Frequency (Hz)');
xlabel('Amplitude');

subplot(3,2,6);
plot(2/nfft * abs(decrypted_fft(1:nfft/2 + 1)),frequencies);
title('Decrypted Audio Spectrum');
ylabel('Frequency (Hz)');
xlabel('Amplitude');

saveas(gcf, 'waveforms_and_spectrum_plot.png');

function encrypted_audio = encrypt_audio(input_audio, key, block_size)
    encrypted_audio = zeros(size(input_audio));
    num_blocks = ceil(length(input_audio) / block_size);
    
    for i = 1:num_blocks
        start_index = (i - 1) * block_size + 1;
        end_index = min(i * block_size, length(input_audio));
        
        block_fft = fft(input_audio(start_index:end_index));
        block_fft = (block_fft + key)/key;
        encrypted_audio(start_index:end_index) = ifft(block_fft);
    end
end

function decrypted_audio = decrypt_audio(encrypted_audio, key, block_size)
    decrypted_audio = zeros(size(encrypted_audio));
    num_blocks = ceil(length(encrypted_audio) / block_size);
    
    for i = 1:num_blocks
        start_index = (i - 1) * block_size + 1;
        end_index = min(i * block_size, length(encrypted_audio));
        
        block_fft = fft(encrypted_audio(start_index:end_index));
        block_fft = ((block_fft)*key) - key;
        decrypted_audio(start_index:end_index) = ifft(block_fft);
    end
end
