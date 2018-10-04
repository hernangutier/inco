<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "comisiones_dt".
 *
 * @property int $id
 * @property int $id_com
 * @property string $nfact
 * @property int $id_client
 * @property string $base_i
 * @property string $date_fact
 *
 * @property Clientes $client
 * @property Comisiones $com
 */
class ComisionesDt extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'comisiones_dt';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_com', 'id_client'], 'integer'],
            [['date_fact'], 'safe'],
            [['nfact'], 'string', 'max' => 20],
            [['base_i'], 'string', 'max' => 45],
            [['nfact'], 'unique'],
            [['id_client'], 'exist', 'skipOnError' => true, 'targetClass' => Clientes::className(), 'targetAttribute' => ['id_client' => 'id']],
            [['id_com'], 'exist', 'skipOnError' => true, 'targetClass' => Comisiones::className(), 'targetAttribute' => ['id_com' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_com' => 'Id Com',
            'nfact' => 'Nfact',
            'id_client' => 'Id Client',
            'base_i' => 'Base I',
            'date_fact' => 'Date Fact',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClient()
    {
        return $this->hasOne(Clientes::className(), ['id' => 'id_client']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCom()
    {
        return $this->hasOne(Comisiones::className(), ['id' => 'id_com']);
    }
}
